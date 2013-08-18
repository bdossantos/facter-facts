require 'facter'

Facter.add('ssd') do
  confine :kernel => 'Linux'

  ssd = []
  Facter::value('blockdevices').split(',').each do |disk|
    file = "/sys/block/#{disk}/queue/rotational"
    output = Facter::Util::FileRead.read(file)
    ssd.push(disk) if output.to_i === 0
  end

  setcode { ssd.join(',') }
end
