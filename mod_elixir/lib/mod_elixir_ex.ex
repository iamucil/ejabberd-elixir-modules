defmodule ModElixirEx do
  @behaviour :gen_mod

  def start(host, _opts) do
    Ejabberd.Hooks.add(:set_presence_hook, host, __ENV__.module, :on_presence, 50)
    :ok
  end
  
  def stop(host) do
    Ejabberd.Hooks.delete(:set_presence_hook, host, __ENV__.module, :on_presence, 50)
    :ok
  end
  
  def on_presence(user, _server, _resource, _packet) do
    :none
  end 
end