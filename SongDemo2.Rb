live_loop :bar do
  sample :loop_garzul
  sleep 0.5
end
with_fx :reverb do
  with_fx(:echo, delay: 0.5, decay: 0.1) do
    live_loop :echoes do
      play chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose, cutoff: rrand(40, 100), amp: 0.5, attack: 0, release: rrand(1, 2), cutoff_max: 110
      sleep [0.1, 0.5, 0.5, 0.5, 1, 1].choose
    end
  end
end

use_synth :chipbass
notes = (ring :E4, :Fs4, :B4, :Cs5, :D5, :Fs4, :E4, :Cs5, :B4, :Fs4, :D5, :Cs5)

live_loop :slow do
  play notes.tick, release: 0.1
  sleep 0.3
end

live_loop :faster do
  play notes.tick, release: 0.1
  sleep 0.3
end

