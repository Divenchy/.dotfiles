#Requires AutoHotkey v2.0
#SingleInstance Force

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

