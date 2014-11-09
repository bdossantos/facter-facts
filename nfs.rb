require 'facter'

Facter.add('nfs') do
  confine :kernel => 'Linux'

  setcode { 'true' } if File.exist? '/etc/init.d/nfs-common'
end
