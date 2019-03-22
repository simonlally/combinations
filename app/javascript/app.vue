<template>
  <div id="app">
    <h1>Combinations</h1>
    <form class='input-form'>
        <ul>
            <li v-for="(item, index) in items" :key="index" >
                <div>
                    <input type="text" placeholder="Name" ref="name" v-model="item.name">  
                    <input type="number" placeholder="Denomination" ref="denom" v-model="item.denom">
                </div>
            </li>
        </ul>
        <button v-on:click="addAnotherDenom($event)">Add another denomination</button>
        <button v-on:click="printCombinations($event)">Print Combinations</button>
    </form>

    <div>         
      <br>
      <br>
      <br>        
      <table v-for="(item, index) in result" :key="index">
        <tr>
          <span v-for="(x, index) in items" :key="index">
            {{x.name}}
          </span>
        </tr>
        <tr v-for="(x, index) in item" :key="index">
          <span v-for="(y, index) in x" :key="index">
            <span v-if="y>=0">{{y}}</span>
          </span> 
        </tr>  
          <p>The count is : {{item.length}}</p> 
      </table>
      </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      items: [
        {name: "", denom: 0},
        {name: "", denom: 0}
      ],
      message: "message",
      result: []
    }
  },
  methods: {
      printCombinations: function (event) {
        var vm = this;
        console.log("DOES THIS WORK");
        console.log(this.items);
        event.preventDefault();

        $.ajax({
          type: "POST",
          url: '/api/coin',
          data: {items: this.items},
          success: function(data) {
            // on success set the response to result
            vm.result.push(data);
          }
        });


      },
      addAnotherDenom: function(event) {
        event.preventDefault();
        var newItem = {name: "", denom: 0};
        this.items.push(newItem);
      }
    }
    
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>


