command: "curl -s https://www.btc-e.com/api/2/btc_usd/ticker"

refreshFrequency: 10000

render: (output) ->  
  data = JSON.parse(output)
  buy = data.ticker.buy
  sell  = data.ticker.sell
  """
  <table>
  	<tr>
  		<td class="col1">$#{buy.toFixed(2)}</td>
  		<td class="col2">$#{sell.toFixed(2)}</td>
  	</tr>
  </table>
  """

style: """
  bottom: 20%
  left: 10px
  color: #fff
  font-family: Helvetica Neue

  table
    border-collapse: collapse
    table-layout: fixed
    
  &:before
      content: 'last buy btc'
      position: absolute
      left: 0
      top: -14px
      font-size: 10px
      
  &:after
      content: 'last sell btc'
      position: absolute
      left: 124px
      top: -14px
      font-size: 10px

  td
    border: 1px solid #fff
    font-size: 24px
    font-weight: 100
    width: 120px
    max-width: 120px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  .col1
    background: rgba(#fff, 0.2)
    text-align: center

  .col2
    background: rgba(#fff, 0.1)
    text-align: center

"""