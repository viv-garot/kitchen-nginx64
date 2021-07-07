describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe package('nginx') do
  its('version') { should eq '1.14.0-0ubuntu1.9' }
end

describe package('docker') do
  it { should_not be_installed }
end

describe service('sshd') do
  it { should be_installed }
  it { should be_running }
end
