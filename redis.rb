require 'facter'

Facter.add('redis') do
  confine :kernel => 'Linux'

  `hash redis-server 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
