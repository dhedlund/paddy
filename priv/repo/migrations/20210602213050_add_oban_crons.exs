defmodule Paddy.Repo.Migrations.AddObanCrons do
  use Ecto.Migration

  def up, do: Oban.Pro.Migrations.DynamicCron.up()

  def down, do: Oban.Migrations.DynamicCron.down()
end
