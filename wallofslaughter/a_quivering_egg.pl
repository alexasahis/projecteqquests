sub EVENT_SPAWN {
  quest::settimer("despawn",100);
  quest::settimer("murkadds",30);
}

sub EVENT_TIMER {
  if($timer eq "murkadds") {
    quest::spawn2(300084,0,0,$x,$y,$z,$h); # NPC: a_murk_hatchling
  }
  if($timer eq "despawn") {
    quest::depop();
  }
}
