require 'facter'

Facter.add('mongodb') do
  confine :kernel => 'Linux'

  `hash mongod 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
