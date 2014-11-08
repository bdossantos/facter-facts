require 'facter'

Facter.add('influxdb') do
  confine :kernel => 'Linux'

  `hash influxdb 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
