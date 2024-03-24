use_bpm 90


live_loop :piano_melody do
  use_synth :piano
  notes = [:c3, :e3, :g3, :b3, :c4, :b3, :g3, :e3]
  durations = [0.5, 1, 0.5, 1, 0.5, 1, 0.5, 1]
  
  play_pattern_timed notes, durations
end

live_loop :bass do
  use_synth :sine
  play_pattern_timed [:c2, :f2, :g2, :a2], [1, 2, 1, 2]
end


live_loop :drums do
  sample :drum_bass_soft, amp: 1.0
  sleep 1
  sample :drum_snare_soft, amp: 1.5
  sleep 1
end


sample #buraya localden wav dosyasının linki gelicek   / https://www.youtube.com/watch?v=eQmc039N0jE /  # , amp: 10 
