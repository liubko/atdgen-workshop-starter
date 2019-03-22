open Belt;

module RR = ReasonReact;
module P = Js.Promise;

type remoteData('data, 'err) =
  | NotAsked
  | Loading
  | Failure('err)
  | Success('data);

type state = {refdomains: remoteData(Refdomains_t.response, string)};

type action =
  | FetchRefdomains
  | SetRefdomains(remoteData(Refdomains_t.response, string));

let component = RR.reducerComponent(__MODULE__);
let make = _children => {
  ...component,
  initialState: () => {refdomains: NotAsked},
  reducer: (action, _state) =>
    switch (action) {
    | FetchRefdomains =>
      RR.UpdateWithSideEffects(
        {refdomains: Loading},
        (
          self =>
            Window.fetch("http://127.0.0.1:8000/refdomains")
            |> P.then_(response => Window.json((), response))
            |> P.then_(responseJson =>
                 P.resolve @@
                 Success(Refdomains_bs.read_response(responseJson))
               )
            |> P.catch(err => {
                 Js.log2("err", err);
                 P.resolve @@ Failure("Oops smth went wrong");
               })
            |> P.then_(refdomains => {
                 self.send @@ SetRefdomains(refdomains);
                 P.resolve();
               })
            |> ignore
        ),
      )
    | SetRefdomains(refdomains) => RR.Update({refdomains: refdomains})
    },
  didMount: self => self.send @@ FetchRefdomains,
  render: self =>
    switch (self.state.refdomains) {
    | NotAsked => RR.string("NotAsked")
    | Loading => RR.string("Loading")
    | Failure(err) => RR.string("Failure: " ++ err)
    | Success(data) =>
      <table>
        <thead>
          <tr>
            <th> {RR.string("Refdomain")} </th>
            <th> {RR.string("Backlinks")} </th>
            <th> {RR.string("First seen")} </th>
          </tr>
        </thead>
        <tbody>
          data.refdomains
          ->(
              List.map(item =>
                <tr key={item.refdomain}>
                  <td> {RR.string(item.refdomain)} </td>
                  <td> {RR.string(string_of_int(item.backlinks))} </td>
                  <td> {RR.string(item.first_seen)} </td>
                </tr>
              )
            )
          ->List.toArray
          ->RR.array
        </tbody>
      </table>
    },
};
