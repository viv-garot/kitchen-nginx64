describe package('nginx') do
  it { should be_installed }
end

describe package('nginx') do
    it { should be_enabled }
end

describe package('nginx') do
    it { should be_running }
end

describe package('docker') do
    it { should be_installed }
end

describe package('netcat') do
    it { should_not be_installed }
end
