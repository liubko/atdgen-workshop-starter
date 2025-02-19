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

let write_stats = (
  Atdgen_codec_runtime.Encode.make (fun (t : stats) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"refdomains"
          t.refdomains
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"ips"
          t.ips
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"class_c"
          t.class_c
      ]
    )
  )
)
let read_stats = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refdomains =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "refdomains"
            ) json;
          ips =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "ips"
            ) json;
          class_c =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "class_c"
            ) json;
      } : stats)
    )
  )
)
let write_refdomain = (
  Atdgen_codec_runtime.Encode.make (fun (t : refdomain) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"refdomain"
          t.refdomain
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"backlinks"
          t.backlinks
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"refpages"
          t.refpages
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"first_seen"
          t.first_seen
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"last_visited"
          t.last_visited
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"domain_rating"
          t.domain_rating
      ]
    )
  )
)
let read_refdomain = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refdomain =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "refdomain"
            ) json;
          backlinks =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "backlinks"
            ) json;
          refpages =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "refpages"
            ) json;
          first_seen =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "first_seen"
            ) json;
          last_visited =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "last_visited"
            ) json;
          domain_rating =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "domain_rating"
            ) json;
      } : refdomain)
    )
  )
)
let write__1 = (
  Atdgen_codec_runtime.Encode.list (
    write_refdomain
  )
)
let read__1 = (
  Atdgen_codec_runtime.Decode.list (
    read_refdomain
  )
)
let write_response = (
  Atdgen_codec_runtime.Encode.make (fun (t : response) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"refdomains"
          t.refdomains
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_stats
            )
          ~name:"stats"
          t.stats
      ]
    )
  )
)
let read_response = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          refdomains =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "refdomains"
            ) json;
          stats =
            Atdgen_codec_runtime.Decode.decode
            (
              read_stats
              |> Atdgen_codec_runtime.Decode.field "stats"
            ) json;
      } : response)
    )
  )
)
