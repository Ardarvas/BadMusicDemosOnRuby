use_bpm 128


define :main_melody do |notes, durations|
  notes.zip(durations).each do |note, duration|
    play note, release: duration * 0.9, amp: 0.6
    sleep duration
  end
end

live_loop :atmospheric_pad do
  use_synth :hollow
  with_fx :reverb, room: 0.8 do
    play chord(:c3, :m9), release: 8, amp: 0.3
    sleep 8
  end
end

live_loop :dark_ambient_bass do
  use_synth :tb303
  with_fx :reverb, room: 0.8 do
    with_fx :distortion, distort: 0.3 do
      play :c1, cutoff: 60, release: 7.5, amp: 0.4
      sleep 8
      play :ab0, cutoff: 65, release: 7.5, amp: 0.4
      sleep 8
    end
  end
end

live_loop :bass do
  use_synth :fm
  with_fx :lpf, cutoff: 80 do
    notes = [:c2, :c2, :eb2, :bb1]
    notes.each do |note|
      play note, release: 0.3, amp: 0.5
      sleep 1
    end
  end
end

live_loop :percussion do
  sample :bd_tek, rate: 1, amp: 0.8
  sleep 0.5
  sample :drum_cymbal_closed, rate: 1.2, amp: 0.4
  sleep 0.5
end

live_loop :melancholic_lead do
  use_synth :blade
  with_fx :reverb, mix: 0.6 do
    with_fx :echo, mix: 0.3 do
      4.times do
        main_melody([:c5, :eb5, :g5, :f5, :eb5, :d5, :c5], [0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5])
      end
      4.times do
        main_melody([:bb4, :c5, :d5, :eb5, :f5, :eb5, :d5], [0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5])
      end
    end
  end
end

live_loop :soft_arpeggio do
  use_synth :pretty_bell
  with_fx :level, amp: 0.3 do
    with_fx :echo, mix: 0.2 do
      16.times do
        play (chord :c3, :minor).choose, release: 0.1
        sleep 0.125
      end
      16.times do
        play (chord :ab3, :major).choose, release: 0.1
        sleep 0.125
      end
    end
  end
end

live_loop :pulsating_synth do
  use_synth :prophet
  with_fx :slicer, phase: 0.25 do
    play :c4, release: 4, cutoff: 80, amp: 0.3
    sleep 4
    play :ab3, release: 4, cutoff: 90, amp: 0.3
    sleep 4
  end
end

live_loop :evolving_texture do
  use_synth :dark_ambience
  notes = (scale :c3, :minor_pentatonic, num_octaves: 2).shuffle
  with_fx :ping_pong, mix: 0.4 do
    with_fx :hpf, cutoff: 70 do
      play notes.tick, attack: 0.1, release: rrand(3, 5), amp: 0.3, cutoff: rrand(70, 100)
    end
  end
  sleep 2
end

live_loop :dark_drone do
  use_synth :growl
  with_fx :reverb, room: 0.9 do
    with_fx :distortion, distort: 0.2 do
      play :c2, release: 8, note_slide: 4, amp: 0.3
      sleep 4
      control note: :bb1
      sleep 4
    end
  end
end
