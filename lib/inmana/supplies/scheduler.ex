defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # CLIENT -> Supervisor starts when the server run
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # State is empty ny default
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # # async
  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # # sync
  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end

  @impl true
  def handle_info(:generate, state) do
    # Sen the notification
    ExpirationNotification.send()

    # Schedule another genserver to do it
    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    # Send a generate message to itself after 7 days
    Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
  end
end
