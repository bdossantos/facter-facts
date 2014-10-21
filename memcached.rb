require 'facter'

Facter.add('memcached') do
  confine :kernel => 'Linux'

  `hash memcached 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
