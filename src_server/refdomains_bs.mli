(* Auto-generated from "refdomains.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type stats = Refdomains_t.stats = { refdomains: int; ips: int; class_c: int }

type refdomain = Refdomains_t.refdomain = {
  refdomain: string;
  backlinks: int;
  refpages: int;
  first_seen: string;
  last_visited: string;
  domain_rating: int
}

type response = Refdomains_t.response = {
  refdomains: refdomain list;
  stats: stats
}

val read_stats :  stats Atdgen_codec_runtime.Decode.t

val write_stats :  stats Atdgen_codec_runtime.Encode.t

val read_refdomain :  refdomain Atdgen_codec_runtime.Decode.t

val write_refdomain :  refdomain Atdgen_codec_runtime.Encode.t

val read_response :  response Atdgen_codec_runtime.Decode.t

val write_response :  response Atdgen_codec_runtime.Encode.t

