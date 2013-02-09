require "spec_helper"

describe "rssh" do
  let(:config_file) { "/etc/rssh.conf" }

  it { should contain_package("rssh").
              with_ensure("present").
              with_before(%r[^File.*#{config_file}]) }
  it { should contain_file(config_file).
              with_ensure("present").
              with_mode("0644") }

  context "default configuration file" do
    it { should contain_file(config_file).
                with_content(/^umask = 022$/) }
    it { should contain_file(config_file).
                with_content(/^logfacility = LOG_USER$/) }
  end

  context "parameters" do
    context "when package is 'rssh_xyz'" do
      let(:params) { {:package => "rssh_xyz"} }
      it { should contain_package("rssh_xyz") }
    end

    context "when config_file is '/usr/local/etc/rssh.conf'" do
      let(:params) { {:config_file => "/usr/local/etc/rssh.conf"} }
      it { should contain_package("rssh").
                  with_before(%r[^File.*/usr/local/etc/rssh.conf]) }
      it { should contain_file("/usr/local/etc/rssh.conf") }
    end

    context "when config_mode is '0600'" do
      let(:params) { {:config_mode => "0600"} }
      it { should contain_file(config_file).with_mode("0600") }
    end

    context "when allow contains 'one' and 'two'" do
      let(:params) { {:allow => ["one", "two"]} }
      it { should contain_file(config_file).
                  with_content(/^allowone$/).
                  with_content(/^allowtwo$/) }
    end

    context "when umask is '077'" do
      let(:params) { {:umask => "077"} }
      it { should contain_file(config_file).with_content(/^umask = 077$/) }
    end

    context "when logfacility is 'local0'" do
      let(:params) { {:logfacility => "local0"} }
      it { should contain_file(config_file).
                  with_content(/^logfacility = local0$/) }
    end

    context "when chrootpath is '/chroot'" do
      let(:params) { {:chrootpath => "/chroot"} }
      it { should contain_file(config_file).
                  with_content(%r{^chrootpath = /chroot$}) }
    end

    context "when users contains 'a' and 'b'" do
      let(:params) { {:users => ["a", "b"]} }
      it { should contain_file(config_file).
                  with_content(/^user = "a"$/).
                  with_content(/^user = "b"$/) }
    end
  end
end
