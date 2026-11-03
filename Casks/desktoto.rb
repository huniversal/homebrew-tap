cask "desktoto" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/huniversal/Desktoto/releases/download/v#{version}/Desktoto-#{version}.zip"
  name "Desktoto"
  desc "macOS menu bar app"
  homepage "https://github.com/huniversal/Desktoto"

  app "Desktoto.app"

  # 서명과 공증이 없는 앱이라 내려받은 앱이 처음 실행할 때 막히지 않도록 격리 속성을 제거한다.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Desktoto.app"],
        writable_paths: ["{{appdir}}/Desktoto.app"]
  end
end
