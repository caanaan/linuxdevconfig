# ~/.tmuxinator/websocket-python.yml

name: websocket-python
root: ~/Sandboxes/Gateway/Gateway.DemosOrExamples/websocket-python


# socket_name: foo

# Runs before everything. Use it to start daemons etc.
# pre: sudo /etc/rc.d/mysqld start

# Runs in each window and pane before window/pane specific commands. Useful for setting up interpreter versions.
# pre_window: rbenv shell 2.0.0-p247

# Pass command line options to tmux. Useful for specifying a different tmux.conf.
# tmux_options: -f ~/.tmux.mac.conf

# Change the command to call tmux.  This can be used by derivatives/wrappers like byobu.
# tmux_command: byobu

# Specifies (by name or index) which window will be selected on project startup. If not set, the first window is used.
# startup_window: logs

# Controls whether the tmux session should be attached to automatically. Defaults to true.
# attach: false

# Runs after everything. Use it to attach to tmux with custom options etc.
# post: tmux -CC attach -t sandbox-dev

windows:
  - editor:
      #layout: main-vertical 
      layout: c47d,237x69,0,0{130x69,0,0,24,106x69,131,0[106x34,131,0,25,106x34,131,35,26]} 
      panes:
        - vim
        -
        -
