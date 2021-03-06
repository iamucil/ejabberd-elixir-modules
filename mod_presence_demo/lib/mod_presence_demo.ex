defmodule ModPresenceDemo do
  @behaviour :gen_mod
  import Ejabberd.Logger

  def start(host, _opts) do
    info('Starting ejabberd module Presence Demo')
    Ejabberd.Hooks.add(:set_presence_hook, host, __ENV__.module, :on_presence, 50)
    :ok
  end

  def stop(host) do
    info('Stopping ejabberd module Presence Demo')
    Ejabberd.Hooks.delete(:set_presence_hook, host, __ENV__.module, :on_presence, 50)
    :ok
  end

  def on_presence(user, _server, _resource, packet) do
    info('Receive presence for #{user}')
    info(inspect(:xml.get_subtag(packet, "show")))
    :none
  end
end
