#Requires AutoHotkey v2.0
#SingleInstance Force

;SC010::q
;SC011::w
SC012::f
SC013::p
SC014::b
SC015::j
SC016::l
SC017::u
SC018::y
SC019::;
;Top row modifiers
; >! is RAlt
>!SC010::{
    Send "@"
}
+>!SC010::{
    Send "{&}"
}
>!SC011::{
    Send "="
}
+>!SC011::{
    Send "{+}"
}
>!SC012::{
    Send "-"
}
+>!SC012::{
    Send "_"
}
>!SC013::{
    Send "{'}"
}
+>!SC013::{
    Send '{"}'
}

; Home Row
;SC01E::a
SC01F::r
SC020::s
SC021::t
;SC022::g
SC023::m
SC024::n
SC025::e
SC026::i
SC027::o

;Home Row modifiers
>!SC01E::
{
    Send "("
}
+>!SC01E::
{
    Send "{!}"
}
>!SC01F::
{
    Send ")"
}
+>!SC01F::
{
    Send "?"
}
>!SC020::
{
    Send "["
}
+>!SC020::
{
    Send "{{}"
}
>!SC021::
{
    Send "]"
}
+>!SC021::
{
    Send "{}}"
}
>!SC022::{
    Send "%"
}
+>!SC022::{
    Send "{#}"
}
;Vim keys mod
>!SC023::{
    Send "{Left}"
}
^>!SC023::{
    Send "^{Left}"
}
+>!SC023::{
    Send "+{Left}"
}
^#>!SC023::{
    Send "^#{Left}"
}
>!SC024::{
    Send "{Down}"
}
^>!SC024::{
    Send "^{Down}"
}
+>!SC024::{
    Send "+{Down}"
}
^#>!SC024::{
    Send "^#{Down}"
}
>!SC025::{
    Send "{Up}"
}
^>!SC025::{
    Send "^{Up}"
}
+>!SC025::{
    Send "+{Up}"
}
^#>!SC025::{
    Send "^#{Up}"
}
>!SC026::{
    Send "{Right}"
}
^>!SC026::{
    Send "^{Right}"
}
+>!SC026::{
    Send "+{Right}"
}
^#>!SC026::{
    Send "^#{Right}"
}


;SC02c::z
;SC02d::x
;SC02e::c
SC02f::d
SC030::v
SC031::k
SC032::h
>!SC02f::{
    Send "``"
}
+>!SC02f::{
    Send "~"
}

; Capslock to backslash
sc03a::{
    Send "\"
}
#sc03a::{
    Send "#\"
}
!sc03a::{
    Send "!\"
}
^sc03a::{
    Send "^\"
}
^!sc03a::{
    Send "^!\"
}

+sc03a::{
    Send "|"
}
+#sc03a::{
    Send "#|"
}
+!sc03a::{
    Send "!|"
}
+^sc03a::{
    Send "^|"
}
^!+sc03a::{
    Send "^!|"
}

