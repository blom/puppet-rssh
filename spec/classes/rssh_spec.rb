require "spec_helper"

describe "rssh" do
  it { should contain_package("rssh").with_ensure("installed") }
  it { should contain_file("/etc/rssh.conf").with_ensure("present").
                                             with_mode("0644") }

  context "when package is 'rssh_xyz'" do
    let(:params) { {:package => "rssh_xyz"} }
    it { should contain_package("rssh_xyz") }
  end

  context "when config_file is '/usr/local/etc/rssh.conf'" do
    let(:params) { {:config_file => "/usr/local/etc/rssh.conf"} }
    it { should contain_file("/usr/local/etc/rssh.conf") }
  end

  context "when config_mode is '0600'" do
    let(:params) { {:config_mode => "0600"} }
    it { should contain_file("/etc/rssh.conf").with_mode("0600") }
  end
end
