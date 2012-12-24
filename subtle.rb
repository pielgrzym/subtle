# -*- encoding: utf-8 -*-
#
# This program can be distributed under the terms of the GNU GPL.
# See the file COPYING.
#
# $Id: .config/subtle/subtle.rb,v 411 2011/11/17 17:35:38 unexist $
#

require "socket"
require "subtle/subtlext" 

# Contrib {{{
begin
  require "/usr/share/subtle-contrib-hg/launcher.rb"
  require "/usr/share/subtle-contrib-hg/selector.rb"

  Subtle::Contrib::Selector.font  = "xft:Envy Code R:pixelsize=28"
  Subtle::Contrib::Launcher.fonts = [
    "xft:Envy Code R:pixelsize=80",
    "xft:Envy Code R:pixelsize=13"
  ]

  Subtle::Contrib::Launcher.browser_screen_num = 0
rescue LoadError
end # }}}

# Options {{{
set :increase_step,      5
set :border_snap,      10
set :default_gravity,   :center
set :urgent_dialogs,    false
set :honor_size_hints,    false
set :gravity_tiling,    false
# }}}

# Screens {{{
screen 1 do
  top     [:title, :spacer, :center, :views, :center, :cpu, :sublets, :separator, :clock]
  bottom  []
  view    0
end

screen 2 do
  top     [:title, :spacer, :tray, :center, :views, :center, :clock]
  bottom  []
  view    5
end

screen 3 do
  top     [:views, :spacer, :title, :center, :wifi, :jdownloader, :center]
  bottom  []
  view    1
end
# }}}

# Styles {{{
style :all do
  padding    2, 6, 2, 6
  background "#1a1a1a"
  font  "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
end

style :title do
  foreground "#FFFFFF"
end

style :views do
  foreground "#7c7c72"
  icon       "#7c7c72"

  style :focus do
    foreground    "#ffffff"
    icon          "#ffffff"
    border_bottom "#acaa53", 2
  end

  style :occupied do
    foreground    "#7c7c72"
    border_bottom "#949269", 2
  end

  style :urgent do
    foreground "#c0bd5c"
    icon       "#c0bd5c"
  end

  style :visible do
    padding_top 0
    border_top  "#494948", 2
  end
end

style :sublets do
  foreground "#7c7c72"
  icon       "#7c7c72"
end

style :separator do
  foreground "#acaa53"
  separator  "∞"
end

style :clients do
  active   "#7c7c72", 2
  inactive "#494948", 2
  margin   2
end

style :subtle do
  panel      "#1a1a1a"
  background "#595959"
  stipple    "#595959"
end # }}}

# Gravities {{{
# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]
gravity :top_left75,     [   0,   0,  50,  75 ]
gravity :top_left25,     [   0,   0,  50,  25 ]
gravity :top_left252,    [   0,  25,  50,  25 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
gravity :top75,          [   0,   0, 100,  75 ]
gravity :top25,          [   0,   0, 100,  25 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  34 ]
gravity :top_right75,    [  50,   0,  50,  75 ]
gravity :top_right25,    [  50,   0,  50,  25 ]
gravity :top_right252,   [  50,  25,  50,  25 ] 

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  34, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  34,  34 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  66,  50,  34, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  66,  50,  34 ]
gravity :bottom_left75,  [   0,  25,  50,  75 ]
gravity :bottom_left25,  [   0,  75,  50,  25 ]
gravity :bottom_left252, [   0,  50,  50,  25 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  66, 100,  34 ]
gravity :bottom75,       [   0,  25, 100,  75 ]
gravity :bottom25,       [   0,  75, 100,  25 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  66,  50,  34 ]
gravity :bottom_right75, [  50,  25,  50,  75 ]
gravity :bottom_right25, [  50,  75,  50,  25 ]
gravity :bottom_right252,[  50,  50,  50,  25 ]


gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

gravity :dia_toolbox,    [   0,   0,  15, 100 ]
gravity :dia_window,     [  15,   0,  85, 100 ]
gravity :scratch,        [ 5, 0, 90, 60 ]
# }}}

# Grabs {{{
# Host specific
host     = Socket.gethostname
modkey   = "W"
# gravkeys = [ "KP_7", "KP_8", "KP_9", "KP_4", "KP_5", "KP_6", "KP_1", "KP_2", "KP_3" ]
# gravkeys = [ "u", "k", "o", 
#              "h", "i", "l",
#              "m", "j", "period" ]

gravkeys = [ "q", "w", "e", "a", "s", "d", "z", "x", "c" ]
# elsif "test" == host #< Usually VMs
#   modkey = "A"
# end

# Views and screens
(1..9).each do |i|
  grab modkey + "-#{i}",   "ViewSwitch#{i}".to_sym
  grab modkey + "-S-#{i}", "ViewJump#{i}".to_sym
end

grab modkey + "-i",  :ScreenJump2
grab modkey + "-o",  :ScreenJump1
grab modkey + "-v",  :ViewJump6

grab modkey + "-S-period", :ViewNext
grab modkey + "-S-comma", :ViewPrev

grab modkey + "-period" do
  vArr = Subtlext::View[:all];
  cindx = vArr.index(Subtlext::View.current);

  for i in 1..vArr.size do
    cV = vArr[(i + cindx) % vArr.size];
    if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
      cV.jump;
      break;
    end
  end
end

grab modkey + "-comma" do
  vArr = Subtlext::View[:all].reverse;
  cindx = vArr.index(Subtlext::View.current);

  for i in 1..vArr.size do
    cV = vArr[(i + cindx) % vArr.size];
    if (!cV.clients.empty? && Subtlext::View.visible.index(cV) == nil) then
      cV.jump;
      break;
    end
  end
end

# Windows
grab modkey + "-B1",      :WindowMove
grab modkey + "-B3",      :WindowResize
grab modkey + "-space",     :WindowFloat
grab modkey + "-f", :WindowFull
grab modkey + "-S-s",     :WindowStick
grab modkey + "-S-equal", :WindowZaphod
grab modkey + "-m",       :WindowRaise
grab modkey + "-n",       :WindowLower
grab modkey + "-h",    :WindowLeft
grab modkey + "-j",    :WindowDown
grab modkey + "-k",      :WindowUp
grab modkey + "-l",   :WindowRight
grab modkey + "-S-c",       :WindowKill
grab modkey + "-y", lambda { |c| c.retag }

# Reload/restart
grab modkey + "-S-C-q",     :SubtleQuit
grab modkey + "-C-r",     <<SCRIPT
subtle -k &>/dev/null
reload=$?
 
if [ $reload -eq 1 ] ; then
  xmessage 'Syntax error, reload anyway?' -center -buttons NO:1,YES:0
  reload=$?
fi
 
[ $reload -eq 0 ] && subtler -r
SCRIPT
grab modkey + "-C-A-r",   :SubtleRestart

# Gravity keys and focus
gravities = [
  [:top_left, :top_left33, :top_left66, :top_left75, :top_left25, :top_left252],
  [:top, :top33, :top66, :top75, :top25],
  [:top_right, :top_right33, :top_right66, :top_right75, :top_right25, :top_right252],
  [:left, :left33, :left66],
  [:center, :center33, :center66],
  [:right, :right33, :right66],
  [:bottom_left, :bottom_left25, :bottom_left33, :bottom_left66, :bottom_left75, :bottom_left252],
  [:bottom, :bottom33, :bottom66],
  [:bottom_right, :bottom_right25, :bottom_right33, :bottom_right66, :bottom_right75, :bottom_right252]
]

gravkey = 'W'

gravities.each_index do |i|
  # Set gravities
  grab "%s-%s" % [ gravkey, gravkeys[i] ], gravities[i]

  # Focus client with gravity
  grab "%s-S-%s" % [ gravkey, gravkeys[i] ], lambda { |cur|
    idx     = 0
    clients = Subtlext::Client.visible.select { |c|
      gravities[i].include?(c.gravity.name.to_sym)
    }

    # Cycle through clients with same gravity
    if clients.include?(cur)
      idx = clients.index(cur) + 1
      idx = 0 if idx >= clients.size
    end

    clients[idx].focus
    clients[idx].raise
  }
end

# Multimedia keys
grab "XF86AudioMute",        :VolumeToggle
grab "XF86AudioRaiseVolume", :VolumeRaise
grab "XF86AudioLowerVolume", :VolumeLower
grab "XF86ScreenSaver",      "slock"
# grab "XF86AudioPlay",        :MpdToggle
# grab "XF86AudioStop",        :MpdStop
# grab "XF86AudioNext",        :MpdNext
# grab "XF86AudioPrev",        :MpdPrevious

# grab modkey + "-m", "mpc current | tr -d '\n' | xclip"

def jump_or_spawn name
  view = Subtlext::View.first(name)
  visible = true if Subtlext::View.visible.include? view 
  if view.clients.empty?
    view.jump
    yield
  else
    view.clients.first.focus
  end
end

# Programs
grab modkey + "-Return" do
  if Subtlext::View.current.to_s == 'project'
    spawn("urxvt -name project")
  else
    spawn("urxvt")
  end
end

grab modkey + "-S-Return" do
  jump_or_spawn :project do
    spawn("urxvt -name project")
  end
end

grab "A-e" do
  jump_or_spawn :editor do
    c = spawn("gvim")
    c.focus
  end
end
grap "A-S-e", "gvim"

grab "A-w" do 
  jump_or_spawn :www do 
    c = spawn("firefox")
    c.focus
  end
end
grap "A-S-w", "firefox"

grab "W-F9" do
  jump_or_spawn :simulacra do 
    c = spawn("VirtualBox")
    c.focus
  end
end
# grab modkey + "-f", "firefox -no-remote -ProfileManager"

# Contrib
grab "W-p" do
  Subtle::Contrib::Launcher.run
end

grab "W-g" do
  Subtle::Contrib::Selector.run
end

# Scratchpad
grab "W-semicolon" do
  if((c = Subtlext::Client["scratch"]))
    c.toggle_stick
    c.raise
    c.focus
  elsif((jc = spawn("urxvtc -name scratch")))
    c.tags  = [] 
    c.flags = [ :stick ]
    c.raise
  end
end

# Tabbing
grab modkey + "-u" do
  Subtlext::Client.recent.uniq[-1].focus
end

# Set layout
# grab modkey + "-]" do
#   # Find stuff
#   view   = Subtlext::View.current
#   tag    = view.tags.first
#   client = view.clients.first
#   urxvt1 = Subtlext::Client['urxvt1']
#   urxvt2 = Subtlext::Client['urxvt2']
# 
#   # Update tags
#   urxvt1 + tag
#   urxvt2 + tag
# 
#   # Update gravities
#   sym = view.name.to_sym
#   client.gravity = { sym => :top75 }
#   urxvt1.gravity = { sym => :bottom_right25 }
#   urxvt2.gravity = { sym => :bottom_left25 }
# end
# }}}

# Tags {{{

tag "terms" do
  match    instance: "xterm|urxvt", name: '[^irssi]'
  gravity  :center
  resize   true
end

tag "project" do
  match instance: "project"
end

tag "scratchpad" do
  match :instance => "scratch"
  gravity :scratch
  urgent true
  stick true
end

tag "browser" do
  match "navigator|(google\-)?chrom[e|ium]|firefox"
  gravity :center
end

tag "editor" do
  match  "[g]?vim"
  # resize true
  gravity :center
end

tag "irc" do
  match name: 'irssi'
  gravity :center
end

tag "mplayer" do
  match   "mplayer"
  float   true
  stick   true
  #urgent  true
end

tag "stick" do
  match  "dialog|subtly|python|gtk.rb|display|pychrom|skype|xev|evince|exe|<unknown>|plugin-container"
  stick  true
  float  true
end

tag "urgent" do
  stick  true
  urgent true
  float  true
end

tag "dialogs" do
  match  "sun-awt-X11-XDialogPeer"
  match type: [ :dialog, :splash ]
  stick true
end

tag "vbox" do 
  match class: "VirtualBox" 
end

# tag "one" do
#   match    "urxvt2"
#   gravity  :bottom_left
# end
# 
# tag "one25" do
#   match    "urxvt2"
#   gravity  :bottom_left25
# end
# 
# tag "two" do
#   match    "urxvt2"
#   gravity  :bottom
# end
# 
# tag "three25" do
#   match    "urxvt1"
#   gravity  :bottom_right25
# end
# 
# tag "seven" do
#   match    "urxvt1"
#   gravity  :top_left
# end
# 
# tag "eight" do
#   match    "urxvt1"
#   gravity  :top
# end
# 
tag "gimp_image" do
  match    role: "gimp-image-window"
  gravity  :gimp_image
end

tag "gimp_toolbox" do
  match    role: "gimp-toolbox$"
  gravity  :gimp_toolbox
end

tag "gimp_dock" do
  match    role: "gimp-dock"
  gravity  :gimp_dock
end

tag "gimp_scum" do
  match role: "gimp-.*|screenshot"
end

tag "dia_window" do
  match   role: "diagram_window"
  gravity :dia_window
end

tag "dia_toolbox" do
  match   role: "toolbox_window"
  gravity :dia_toolbox
end

tag "inkscape" do
  match "inkscape"
end

tag "xmessage" do
  match  "xmessage" 
  float  true
  stick  true
  urgent true
end
# }}}

icons     = true
iconpath = "#{ENV["HOME"]}/.local/share/icons"

space = {
  :cannon  => Subtlext::Icon.new("#{iconpath}/cannon.xbm"),
  :ufo     => Subtlext::Icon.new("#{iconpath}/ufo.xbm"),
  :shelter => Subtlext::Icon.new("#{iconpath}/shelter.xbm"),
  :terms   => Subtlext::Icon.new("#{iconpath}/invader1.xbm"),
  :www     => Subtlext::Icon.new("#{iconpath}/invader2.xbm"),
  :void    => Subtlext::Icon.new("#{iconpath}/invader3.xbm"),
  :sketch  => Subtlext::Icon.new("#{iconpath}/invader4.xbm"),
  :project => Subtlext::Icon.new("#{iconpath}/invader5.xbm"),
  :editor  => Subtlext::Icon.new("#{iconpath}/invader6.xbm")
}

view "terms" do
  match     "terms"
  icon      Subtlext::Icon.new("#{iconpath}/cannon.xbm")
  icon_only icons
end

view "www" do
  match     "browser"
  icon      Subtlext::Icon.new("#{iconpath}/ufo.xbm")
  icon_only icons
end

view "project" do
  match     "project"
  dynamic false
  #icon      "#{iconpath}/bug.xbm"
  icon      Subtlext::Icon.new("#{iconpath}/invader5.xbm")
  icon_only icons
end

view "editor" do
  match     "editor"
  #icon      "#{iconpath}/ruby.xbm"
  icon      Subtlext::Icon.new("#{iconpath}/invader6.xbm")
  icon_only icons
end

view "sketch" do
  match     "inkscape|dia_*|gimp_.*"
  icon      Subtlext::Icon.new("#{iconpath}/invader4.xbm")
  icon_only icons
  dynamic true
end

view "irc" do 
  match "irc"
  icon      Subtlext::Icon.new("#{iconpath}/invader1.xbm")
  icon_only icons
  dynamic true
end

view "simulacra" do
  match "vbox"
  icon      Subtlext::Icon.new("#{iconpath}/invader4.xbm")
  icon_only icons
  dynamic true
end

view "nil" do
  match 'default'
  icon      Subtlext::Icon.new("#{iconpath}/invader2.xbm")
  icon_only icons
  dynamic true
end
# 
# on :view_jump do |v|
#   views = Hash[*Subtlext::Screen.all.map { |s|
#     [ s.view.name.to_sym, space[space.keys[s.id]] ] }.flatten
#   ]
# 
#   Subtlext::View.all.each do |va|
#     sym = va.name.to_sym
# 
#     if views.keys.include?(sym)
#       va.icon.copy_area(views[sym])
#     else
#       va.icon.copy_area(space[va.name.to_sym])
#     end
#   end
# 
#   Subtlext::Subtle.render
# end
# }}}

# Sublets {{{
sublet :clock do
  format_string "%H:%M - %d.%m.%Yr"
end

# }}}

on :start do
  views = Subtlext::View.all.map { |v| v.name }
  spawn("nitrogen --restore")
end

on :view_jump do |v|
  if v.name == 'project'
    spawn('urxvt -name project')
  end
end

on :client_focus do |c|
  if c.name =~ /irssi/ #&& c.tags.include?('terms')
    c.tags = ['irc']
  end 
end
