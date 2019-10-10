<template>
<div id="app">
    <div class="main">
        <h1 is="sui-header" textAlign="center" attached="top"> Coin Combinations </h1>
        <sui-segment attached> Enter the name of the denomination and the number required of that denomination to reach our target sum. For example, to see the number of ways pennies, nickels, dimes, and quarters can be combined to sum exactly $1, enter in "Penny" and "100" in the "Number of Denomination" field, "Nickel" and "20", "Dime" and "10", etc. This works for any arbitrary set of currency names and denominations. </sui-segment>
    </div>
    <sui-form>
        <ul>
            <li v-for="(item, index) in items" :key="index">
                <sui-form-field>
                    <label> {{index+1}} </label>
                    <input type="text" placeholder="Name" ref="name" v-model="item.name">
                    <input type="number" placeholder="Number of Denominations" ref="denom" v-model="item.denom">
                </sui-form-field>
            </li>
        </ul>
        <sui-button v-on:click="addAnotherDenom($event)">Add another currency type</sui-button>
        <sui-button v-on:click="printCombinations($event)">Print Combinations</sui-button>
    </sui-form>
    <div>
        <br>
        <br>
        <br>
        <sui-table basic v-for="(item, index) in result" :key="index">
            <sui-table-header>
                <sui-table-header-cell v-for="(x, index) in items" :key="index"> {{x.name}}
                </sui-table-header-cell>
            </sui-table-header>
            <sui-table-body>
                <sui-table-row v-for="(x, index) in item" :key="index">
                    <sui-table-cell v-for="(y, index) in x" :key="index" v-if="y>=0">
                      {{y}}
                    </sui-table-cell>
                </sui-table-row>
            </sui-table-body>
        </sui-table>

    </div>
</div>
</div>
</template>

<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.min.js"></script>
<script src="https://unpkg.com/semantic-ui-vue/dist/umd/semantic-ui-vue.min.js"></script>
<script>
export default {
    data: function () {
        return {
            items: [{
                name: "",
                "number of denominations": 0
            }, {
                name: "",
                "number of denominations": 0
            }],
            message: "message",
            result: []
        };
    },
    methods: {
        printCombinations: function (event) {
            var vm = this;
            event.preventDefault();

            this.result = [];

            $.ajax({
                type: "POST",
                url: "/api/coin",
                data: {
                    items: this.items
                },
                success: function (data) {
                    // on success set the response to result
                    vm.result.push(data);
                }
            });
        },
        addAnotherDenom: function (event) {
            event.preventDefault();
            var newItem = {
                name: "",
                "number of denominations": 0
            };
            this.items.push(newItem);
        }
    }
};
</script>
