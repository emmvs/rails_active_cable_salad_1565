import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  // * Targets: Div, Button, Card, user input etc.
  // When you directly want to interact w/ the Dom (eventListeners, change styles/properties)

  static values = { chatroomId: Number }
  // * Values: Information, ID, Api Key 
  // When you wnat to keep track of data associated w/ your controller

  connect() {
    console.log("👻 The current id of chatroom is:", this.chatroomIdValue);
    // console.log("👻 Messages Index", this.messagesTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessages(data)}
    )
  }

  #insertMessages(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // TODO Fix scrolling up
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  // TODO: resetForm
  resetForm(event) {
    event.target.reset();
  }

  // TODO: Disconnect Channel
  disconnect() {
    console.log("Unsubscribed from the chatroom 👋")
    this.channel.unsubscribe()
  }
}
