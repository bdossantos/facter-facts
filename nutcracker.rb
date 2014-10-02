require 'facter'

Facter.add('nutcracker') do
  confine :kernel => 'Linux'

  `hash nutcracker 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
