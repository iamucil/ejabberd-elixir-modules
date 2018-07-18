defmodule ModFilterPacketEx do
  use Ejabberd.Module

  import Ejabberd.Logger

  def start(_host, _opts) do
    info('Starting ejabberd module Filter Packet Demo')
    Ejabberd.Hooks.add(:filter_packet, :global, __ENV__.module, :on_filter_packet)
    :ok
  end

  def stop(_host) do
    info('Stoping ejabberd module Filter Packet Demo')
    Ejabberd.Hooks.delete(:filter_packet, :global, __ENV__.module, :on_filter_packet)
    :ok
  end

  def on_filter_packet({from, to, xml} = packet) do
    info("Filtering packet: #{inspect({from, to, xml})}")
    packet
  end
end
