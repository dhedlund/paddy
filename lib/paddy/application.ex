defmodule Paddy.Application do
  @moduledoc false

  use Application

  alias Oban.Pro.Plugins.DynamicCron
  alias Paddy.DummyWorker

  def start(_type, _args) do
    children = [
      Paddy.Repo,
      {Oban, oban_config()}
    ]

    result = Supervisor.start_link(children, strategy: :one_for_one, name: Paddy.Supervisor)

    {:ok, _cron_entries} =
      DynamicCron.insert(:paddy, [
        {"* * * * *", NonExistentWorker}
      ])

    result
  end

  # Conditionally disable queues or plugins here.
  defp oban_config do
    Application.fetch_env!(:paddy, Oban)
  end
end
