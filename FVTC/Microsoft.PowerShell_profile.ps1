#Create a custom alias command
Set-Alias ds Write-Host

#Clear the Windows command console screen
clear

# dat skull
ds "                              .                                                      ."
ds "                            .n                   .                 .                  n."
ds "                      .   .dP                  dP                   9b                 9b.    ."
ds "                     4    qXb         .       dX                     Xb       .        dXp     t"
ds "                    dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb"
ds "                    9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP"
ds "                     9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP"
ds "                      ``9XXXXXXXXXXXXXXXXXXXXX'~   ~``OOO8b   d8OOO'~   ~``XXXXXXXXXXXXXXXXXXXXXP'"
ds "                        ``9XXXXXXXXXXXP' ``9XX'   " -noNewLine
ds "POWER" -foreground red -noNewLine
ds "  ``98v8P'   " -noNewLine
ds "SHELL" -foreground red -noNewLine
ds "  ``XXP' ``9XXXXXXXXXXXP'"
ds "                            ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~"
ds "                                            )b.  .dbo.dP'``v'``9b.odb.  .dX("
ds "                                          ,dXXXXXXXXXXXb     dXXXXXXXXXXXb."
ds "                                         dXXXXXXXXXXXP'   .   ``9XXXXXXXXXXXb"
ds "                                        dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb"
ds "                                        9XXb'   ``XXXXXb.dX|Xb.dXXXXX'   ``dXXP"
ds "                                         ``'      9XXXXXX(   )XXXXXXP      ``'"
ds "                                                  XXXX X.``v'.X XXXX"
ds "                                                  XP^X'``b   d'``X^XX"
ds "                                                  X. 9  ``   '  P )X"
ds "                                                  ``b  ``       '  d'"
ds "                                                   ``             '"

function Get-Time { return $(get-date | foreach { $_.ToLongTimeString() } ) }
function prompt
{
    # Write the time 
    write-host "[" -noNewLine
    write-host $(Get-Time) -foreground yellow -noNewLine
    write-host "] " -noNewLine
    # Write the path
    write-host $($(Get-Location).Path.replace($home,">>").replace("\","/")) -foreground white -noNewLine
    write-host $(if ($nestedpromptlevel -ge 1) { '>>' }) -noNewLine
    return "> "
}

# LS.MSH 
# Colorized LS function replacement 
# /\/\o\/\/ 2006 
# http://mow001.blogspot.com 
function LL
{
    param ($dir = ".", $all = $false) 

    $origFg = $host.ui.rawui.foregroundColor 
    if ( $all ) { $toList = ls -force $dir }
    else { $toList = ls $dir }

    foreach ($Item in $toList)  
    { 
        Switch ($Item.Extension)  
        { 
            ".Exe" {$host.ui.rawui.foregroundColor = "Yellow"} 
            ".cmd" {$host.ui.rawui.foregroundColor = "Red"} 
            ".msh" {$host.ui.rawui.foregroundColor = "Red"} 
            ".vbs" {$host.ui.rawui.foregroundColor = "Red"} 
            Default {$host.ui.rawui.foregroundColor = $origFg} 
        } 
        if ($item.Mode.StartsWith("d")) {$host.ui.rawui.foregroundColor = "Green"}
        $item 
    }  
    $host.ui.rawui.foregroundColor = $origFg 
}

function lla
{
    param ( $dir=".")
    ll $dir $true
}

function la { ls -force }
