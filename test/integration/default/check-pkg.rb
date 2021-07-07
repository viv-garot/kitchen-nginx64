describe package('nginx') do
  it { should be_installed }
end

describe package('vim') do
    it { should be_installed }
end

describe package('docker') do
    it { should be_installed }
end

describe package('netcat') do
    it { should be_installed }
end

describe package('vim-addon-manager') do
    it { should not_be_installed }
end
