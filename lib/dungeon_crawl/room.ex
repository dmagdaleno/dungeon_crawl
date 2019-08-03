defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action
  
  defstruct description: nil, actions: [], trigger: nil, probability: 0

  def all, do: [
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit, 
      probability: 1
    },
    %Room{
      description: "You found a quiet place. Looks safe for a little nap.",
      actions: [forward(), rest()],
      trigger: Triggers.Rest, 
      probability: 4
    },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy, 
      probability: 5
    }
  ]
end