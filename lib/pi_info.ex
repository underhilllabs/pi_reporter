defmodule PiInfo do
  require Logger

  # get Hostname
  def my_hostname do
    {str, res} = System.cmd("hostname",[])
    str |> String.strip
  end 

  # get IP address
  def my_ip do
    {str, res} = System.cmd("ifconfig", ["eth0"])
    [all, ip] = Regex.run(~r/addr:(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/, str)
    ip
  end 

  def free_m do
    {str, _} = System.cmd("free", ["-m"])
    # [str] = str |> String.split("\n") |> Enum.drop(1) |> Enum.take(1)
    [_, mem_str, _, _, _] = String.split(str, "\n")
    [_, all, used, free, _, _, _] = String.split(mem_str) 
    {all, used, free} 
  end
end

