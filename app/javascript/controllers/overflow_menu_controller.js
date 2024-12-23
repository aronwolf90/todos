import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "overflow-menu"

  connect() {
    super.connect()
    
    this.send("connect", {}, () => {
      this.element.click()
    })
  }
}
