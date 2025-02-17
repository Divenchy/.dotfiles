/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx = 4; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const unsigned int gappih = 20;  /* horiz inner gap between windows */
static const unsigned int gappiv = 10;  /* vert inner gap between windows */
static const unsigned int gappoh =
    10; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov =
    10; /* vert outer gap between windows and screen edge */
static const int smartgaps =
    0; /* 1 means no outer gap when there is only one window */
static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */
static const int user_bh =
    10; /* 2 is the default spacing around the bar's font */
static const int vertpad = 10; /* vertical padding of bar */
static const int sidepad = 10; /* horizontal padding of bar */
static const int attachbelow =
    1; /* 1 means attach after the currently active window */
static const char *fonts[] = {"JetBrainsMono Nerd Font:size=18"};
static const char dmenufont[] = "JetBrainsMono Nerd Font:size=10";
static const char dmenuprompt[] = "OPEN APP:";
static const char col_gray1[] = "#222222";
static const char col_gray2[] = "#444444";
static const char col_gray3[] = "#bbbbbb";
static const char col_gray4[] = "#eeeeee";
static const char col_cyan[] = "#6c8277";
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {col_gray3, col_gray1, col_gray2},
    [SchemeSel] = {col_gray4, col_cyan, col_cyan},
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
};

/* layout(s) */
static const float mfact = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    1; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT                                                           \
  1 /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile},
    /* first entry is default */     // 0
    {"[M]", monocle},                // 1
    {"[@]", spiral},                 // 2
    {"[\\]", dwindle},               // 3
    {"H[]", deck},                   // 4
    {"TTT", bstack},                 // 5
    {"===", bstackhoriz},            // 6
    {"HHH", grid},                   // 7
    {"###", nrowgrid},               // 8
    {"---", horizgrid},              // 9
    {":::", gaplessgrid},            // 10
    {"|M|", centeredmaster},         // 11
    {">M>", centeredfloatingmaster}, // 12
    {"><>", NULL},
    /* no layout function means floating behavior */ // 13
    {NULL, NULL},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* commands */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"dmenu_run", "-i", "-p", dmenuprompt, NULL};
static const char *roficmd[] = {"rofi", "-show", "drun", NULL};
static const char *termcmd[] = {"wezterm", NULL};
static const char *firefoxcmd[] = {"firefox", NULL};
static const char *powermenu[] = {"/home/weoweo/.scripts/dmenu/powermenu.sh"};

/* brightness */
static const char *brighten[] = {"brightnessctl", "set", "5%+", NULL};
static const char *dim[] = {"brightnessctl", "set", "5%-", NULL};

/*Volume */
static const char *vol_up[] = {"amixer", "set", "Master", "5%+", NULL};
static const char *vol_down[] = {"amixer", "set", "Master", "5%-", NULL};
static const char *vol_toggle[] = {"amixer", "set", "Master", "toggle", NULL};

/*Screenshot utility*/
static const char *screenie_box[] = {
    "/home/weoweo/.scripts/weoDWM/screenie_area_n_clipboard.sh"};
static const char *screenie_window[] = {
    "/home/weoweo/.scripts/weoDWM/screenie_window_n_clipboard.sh"};

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_space, spawn, {.v = roficmd}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_w, spawn, {.v = termcmd}},
    {MODKEY, XK_f, spawn, {.v = firefoxcmd}},
    {MODKEY | ShiftMask, XK_Escape, spawn, {.v = powermenu}},
    {MODKEY, XK_s, spawn, {.v = screenie_box}},
    {MODKEY | ShiftMask, XK_s, spawn, {.v = screenie_window}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_h, setcfact, {.f = +0.25}},
    {MODKEY | ShiftMask, XK_l, setcfact, {.f = -0.25}},
    {MODKEY | ShiftMask, XK_o, setcfact, {.f = 0.00}},
    //{ MODKEY,                       XK_Return, zoom,           {0} },
    {MODKEY | Mod1Mask, XK_u, incrgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_u, incrgaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_i, incrigaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_i, incrigaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_o, incrogaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_o, incrogaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_6, incrihgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_6, incrihgaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_7, incrivgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_7, incrivgaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_8, incrohgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_8, incrohgaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_9, incrovgaps, {.i = +1}},
    {MODKEY | Mod1Mask | ShiftMask, XK_9, incrovgaps, {.i = -1}},
    {MODKEY | Mod1Mask, XK_0, togglegaps, {0}},
    {MODKEY | Mod1Mask | ShiftMask, XK_0, defaultgaps, {0}},
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY | ShiftMask, XK_q, killclient, {0}},
    {MODKEY | ControlMask, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY | ControlMask, XK_f, setlayout, {.v = &layouts[13]}},
    {MODKEY | ControlMask, XK_m, setlayout, {.v = &layouts[1]}},
    {MODKEY | ControlMask, XK_s, setlayout, {.v = &layouts[2]}},
    {MODKEY | ControlMask, XK_h, setlayout, {.v = &layouts[5]}},
    {MODKEY | ShiftMask, XK_f, togglefloating, {0}},
    //{ MODKEY,                       XK_space,  setlayout,      {0} },
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    {0, XF86XK_MonBrightnessUp, spawn, {.v = brighten}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = dim}},
    {0, XF86XK_AudioMute, spawn, {.v = vol_toggle}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = vol_up}},
    {0, XF86XK_AudioLowerVolume, spawn, {.v = vol_down}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8){MODKEY, XK_Escape, quit, {0}},
    {MODKEY | ShiftMask, XK_k, viewtoleft, {0}},
    {MODKEY | ShiftMask, XK_j, viewtoright, {0}},
    {MODKEY | ControlMask, XK_k, tagtoleft, {0}},
    {MODKEY | ControlMask, XK_n, tagtoright, {0}},
    TAGKEYS(XK_1, 0)};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
