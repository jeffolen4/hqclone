import consumer from "./consumer"


document.addEventListener("turbolinks:load", () => {

  const element = document.getElementById("game-id");
  const room_id = element.getAttribute('data-game-id')

  consumer.subscriptions.create({ channel: "TriviaChannel", game_id: room_id}, {
    connected() {
      console.log("Connected to trivia channel. Game_id: "+room_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log("disconnected....")
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
    }
  });
});
