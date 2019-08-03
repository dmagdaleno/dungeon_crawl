defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def run(character, %DungeonCrawl.Room.Action{id: :forward}), do: {character, :forward}

  def run(character, %DungeonCrawl.Room.Action{id: :rest}) do
    recover = Enum.random(3..8)
    updated_char = Character.heal(character, recover)
    Shell.info("You rested a little and recovered #{recover} HP.")
    Shell.info(Character.current_stats(updated_char))
    {updated_char, :rest}
  end
end