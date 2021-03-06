{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "bazel-kazel";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "kubernetes";
    repo = "repo-infra";
    rev = "v${version}";
    sha256 = "1mmla4j30ka368gsf4v8h23f32rsc4fpyrqswafw98x07xngmmqr";
  };

  vendorSha256 = "1pzkjh4n9ai8yqi98bkdhicjdr2l8j3fckl5n90c2gdcwqyxvgkf";

  doCheck = false;

  subPackages = [ "cmd/kazel" ];

  meta = with lib; {
    description = "kazel - a BUILD file generator for go and bazel";
    homepage = "https://github.com/kubernetes/repo-infra";
    license = licenses.asl20;
    maintainers = with maintainers; [ kalbasit ];
  };
}
