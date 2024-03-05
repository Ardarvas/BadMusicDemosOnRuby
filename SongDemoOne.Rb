use_bpm 130

live_loop :met1 do
  sleep 0.5
end

cmaster1 = 130
cmaster2 = 130

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :kick, sync: :met2 do
  ##| stop
  a = 0.8
  sample :bd_tek, amp: b, cutoff: cmaster1 if pattern "x-x-x-x-x-x--x-x-x-x-x-x-x-x-x-x-x-x-x---x--"
  sleep 1.5
end

with_fx :echo, mix: 0.2 do
  with_fx :reverb, mix: 0.2, room: 0.5 do
    live_loop :clap, sync: :met1 do
      ##| stop
      a = 0.75
      sleep 1
      sample :drum_snare_hard, rate: 16, cutoff: cmaster1, amp: a
      sample :drum_snare_hard, rate: 4, start: 0.02, cutoff: cmaster1, pan: 0.2, amp: a
      sample :drum_snare_hard, rate: 32, start: 0.04, cutoff: cmaster1, pan: -0.2, amp: a
      sleep 1
    end
  end
end

with_fx :reverb, mix: 0.6 do
  with_fx :panslicer, mix: 0.6 do
    live_loop :hhc1, sync: :met1 do
      ##| stop
      a = 0.5
      p = [-0.4, 0.8].choose
      sample :drum_cymbal_closed, amp: a, rate: 0.05, finish: 0.5, pan: p, cutoff: cmaster2 if pattern "x-x-x-x-x-x-x-x-xxx-x-x-x-x-x-x-"
      sleep 0.125
    end
  end
end

live_loop :hhc2, sync: :met1 do
  ##| stop
  a = 2
  sleep 1
  sample :drum_cymbal_closed, cutoff: cmaster2, rate: 0.5, start: 0.1, finish: 0.5, amp: a
  sleep 1
end

with_fx :reverb, mix: 0.7 do
  live_loop :crash, sync: :met1 do
    ##| stop
    a = 5
    c = cmaster2-10
    r = 5
    f = 0.1
    crash = :drum_splash_soft
    sleep 14.5
    sample crash, amp: a, cutoff: a, rate: r, finish: f
    sample crash, amp: a, cutoff: a, rate: r-0.2, finish: f
    sleep 0.5
    sample crash, amp: a, cutoff: a, rate: r, finish: f
    sample crash, amp: a, cutoff: a, rate: r-0.2, finish: f
    sleep 0.5
  end
end

with_fx :reverb, mix: 1 do
  live_loop :arp, sync: :met1 do
    with_fx :echo, phase: 2, mix: (line 0.1, 1, steps: 164).mirror.tick do
      ##| stop
      a = 0.3
      r = 0.25
      c = 130
      p = (line -0.7, 0.7, steps: 64).mirror.tick
      at = 0.01
      use_synth :beep
      tick
      notes = (scale :g4, :major_pentatonic).shuffle
      play notes.look, amp: a, release: r, cutoff: c, pan: p, attack: at
      sleep 0.75
    end
  end
end

with_fx :panslicer, mix: 0.1 do
  with_fx :reverb, mix: 0.9 do
    live_loop :synthbass, sync: :met1 do
      ##| stop
      s = 6
      r = 4
      c = 1
      a = 0.75
      at = 200
      use_synth :tech_saws
      play :g3, sustain: 1, cutoff: c, amp: a, attack: at
      sleep 12
      play :g3, sustain: 1, cutoff: c, amp: a, attack: at
      sleep 1
      play :g3, sustain: 1, cutoff: c, amp: a, attack: at
      sleep 1
    end
  end
end
use_synth :dsaw
use_bpm 75
use_random_seed 3
use_debug false

with_fx :reverb do
  with_fx(:echo, delay: 0.5, decay:20) do
    live_loop :echoes do
      play chord([:b1, :b2, :g1, :e2, :b3, :e3].choose, :minor).choose, cutoff: rrand(80, 100), amp: 0.5, attack: 1, release: rrand(1, 2), cutoff_max: 110
      sleep [2 , 0.05, 1, 0.5, 1, 1].choose
    end
  end
