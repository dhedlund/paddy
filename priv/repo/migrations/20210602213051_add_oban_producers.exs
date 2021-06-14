defmodule Paddy.Repo.Migrations.AddObanCrons do
  use Ecto.Migration

  def up, do: Oban.Pro.Migrations.Producers.up()

  def down, do: Oban.Migrations.Producers.down()
end
