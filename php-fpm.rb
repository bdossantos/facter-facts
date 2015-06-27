require 'facter'

Facter.add('php_fpm') do
  confine :kernel => 'Linux'

  `hash php5-fpm 2>/dev/null`
  setcode { 'true' } if $?.exitstatus === 0
end
