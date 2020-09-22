<template>
  <div>
    <header>
      <div class="nav-left">
        <div class="header-left">
          <img class="burger-menu" src="@/icons/burger-menu.png" alt />
          <h1 class="title">History</h1>
        </div>
      </div>
    </header>
    <article>
      <aside class="main-navigation">
        <router-link to="/">
          <img class="fork-icon" src="@/icons/fork.png" alt />
        </router-link>
        <img class="fork-icon" src="@/icons/clipboard.png" alt />
        <img class="fork-icon" src="@/icons/add.png" alt />
      </aside>
      <main>
        <div class="main-article">
          <div class="income">
            <div class="income-text">
              <h4>Today's Income</h4>
              <h3>Rp. 1.000.000</h3>
              <h4>+2% Yesterday</h4>
            </div>
            <div class="circle-1"></div>
            <div class="circle-2"></div>
            <div class="circle-3"></div>
          </div>
          <div class="orders">
            <div class="income-text">
              <h4>Orders</h4>
              <h3>{{history.length}}</h3>
              <h4>+2% Last Week</h4>
            </div>
            <div class="circle-1"></div>
            <div class="circle-2"></div>
            <div class="circle-3"></div>
          </div>
          <div class="income-year">
            <div class="income-text">
              <h4>Year’s Income</h4>
              <h3>Rp. 10.000.000</h3>
              <h4>+10% Last Year</h4>
            </div>
            <div class="circle-1"></div>
            <div class="circle-2"></div>
            <div class="circle-3"></div>
          </div>
        </div>
        <img class="img-chart" src="@/icons/Chart.png" alt />
        <div class="recent-order text-style">
          <div class="container">
            <div class="space-width"></div>
            <div class="row">
              <div class="col-11">
                <h4>Recent Order</h4>
              </div>
              <div class="col">
                <div class="option-recent">Today</div>
              </div>
            </div>
            <div class="mt-3"></div>
            <div class="row font-recent-order">
              <div class="col">
                <h5>INVOICE</h5>
              </div>
              <div class="col">
                <h5>CASHIER</h5>
              </div>
              <div class="col">
                <h5>DATE</h5>
              </div>
              <div class="col">
                <h5>ORDERS</h5>
              </div>
              <div class="col">
                <h5>AMOUNT</h5>
              </div>
            </div>
          </div>
          <div class="line"></div>
          <div class="container" v-for="items in history" :key="items.orders">
            <div class="row font-invoice">
              <div class="col">
                <h5>#{{items.invoices}}</h5>
              </div>
              <div class="col">
                <h5>{{items.cashier}}</h5>
              </div>
              <div class="col">
                <h5>{{items.date}}</h5>
              </div>
              <div class="col">
                <h5>{{items.orders}}</h5>
              </div>
              <div class="col">
                <h5>Rp. {{items.amount}}</h5>
              </div>
            </div>
          </div>
        </div>
      </main>
    </article>
  </div>
</template>

<script>
import axios from "axios"
export default {
  name: "History",
  data: function () {
    return {
      history: [],
    }
  },
  methods: {
    getHistory: function () {
      axios
        .get("http://127.0.0.1:1999/history")
        .then((res) => {
          this.history = res.data
        })
        .catch((err) => alert(err.message))
    },
  },
  mounted() {
    this.getHistory()
  },
}
</script>

<style scoped>
header {
  display: flex;
}
.nav-left {
  width: 100%;
  height: 100px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
  background-color: #ffff;
}
.nav-right {
  width: 491px;
  height: 100px;
  box-shadow: 0psx 4px 10px rgba(0, 0, 0, 0.25);
  background-color: #ffff;
  box-shadow: 0px 4px 1px rgba(0, 0, 0, 0.25);
}
.header-left {
  display: flex;
  justify-content: space-between;
}
.burger-menu {
  margin: 30px;
}
.search-menu {
  margin: auto;
  margin-right: 31.31px;
}
.title {
  margin: auto;
  font-family: "Barlow", sans-serif;
}
.cart {
  width: 491px;
}
.cart-text {
  margin-top: 30px;
  margin-left: 240px;
  font-family: "Barlow", sans-serif;
}
.box-cart {
  margin-top: 40px;
  margin-left: 5px;
  padding-top: 2px;
  width: 25px;
  height: 25px;
  font-family: "Barlow", sans-serif;
  border-radius: 50%;
  text-align: center;
  font-weight: bold;
  background: #57cad5;
  color: white;
}
.header-right {
  display: flex;
}
article {
  display: flex;
}
.main-navigation {
  width: 109px;
  height: 938px;
  background: #ffffff;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
}
.fork-icon {
  margin-top: 32.48px;
  margin-left: 28px;
}
.food-menu {
  display: flex;
  width: 893px;
  height: 940px;
  flex-wrap: wrap;
  background: rgba(190, 195, 202, 0.3);
}
.no-order {
  margin-top: 173px;
  margin-left: 163px;
}
.text-empty {
  position: absolute;
  top: 430px;
  font-family: "Barlow", sans-serif;
  font-size: 30px;
  line-height: 39px;
  margin-left: 150px;
}
.text-add-order {
  font-family: "Barlow", sans-serif;
  font-size: 20px;
  line-height: 26px;
  color: #cecece;
  margin-left: 100px;
}
.menu {
  margin: auto;
  width: 251px;
  height: 267px;
}
h3 {
  margin: 0;
  font-family: "Barlow", sans-serif;
  color: #000000;
  font-size: 25px;
  line-height: 33px;
}
.income-text h3,
.income-text h4 {
  font-family: "Barlow", sans-serif;
  font-size: 20px;
}
p {
  margin: 0;
  font-weight: bold;
  font-family: "Barlow", sans-serif;
  color: #000000;
  font-size: 25px;
  line-height: 33px;
}
.main-article {
  display: flex;
}
.income-text {
  /* position: absolute; */
  margin-top: 65px;
  margin-left: 50px;
  /* z-index: 5; */
}
.income {
  display: flex;
  margin-top: 20px;
  margin-left: 20px;
  width: 402px;
  height: 213px;
  background: linear-gradient(
    278.29deg,
    #fbb2b4 30.05%,
    rgba(255, 143, 178, 0) 133.19%
  );
  filter: drop-shadow(10px 15px 10px rgba(255, 143, 178, 0.25));
  border-radius: 10px;
}
.orders {
  display: flex;
  margin-top: 20px;
  margin-left: 20px;
  width: 402px;
  height: 213px;
  background: linear-gradient(
    278.29deg,
    #29dfff 30.05%,
    rgba(41, 223, 255, 0) 133.19%
  );
  filter: drop-shadow(10px 15px 10px rgba(41, 223, 255, 0.25));
  border-radius: 10px;
}
.income-year {
  display: flex;
  margin-top: 20px;
  margin-left: 20px;
  width: 402px;
  height: 213px;
  background: linear-gradient(
    278.29deg,
    #ab84c8 30.05%,
    rgba(241, 201, 236, 0) 133.19%
  );
  filter: drop-shadow(10px 15px 10px rgba(241, 201, 236, 0.25));
  border-radius: 10px;
}
.circle-1 {
  width: 100px;
  height: 100px;
  background: rgba(253, 211, 228, 0.3);
  border-radius: 50%;
  margin-top: 50px;
  /* z-index: 1; */
}
.circle-2 {
  width: 100px;
  height: 100px;
  background: rgba(253, 211, 228, 0.3);
  border-radius: 50%;
  /* margin-left: 36px; */
}
.circle-1 {
  width: 100px;
  height: 100px;
  background: rgba(253, 211, 228, 0.3);
  border-radius: 50%;
  margin-top: 50px;
  z-index: 1;
}
.recent-order {
  margin-left: 17px;
  width: 1258px;
  height: 230px;
  background: #ffffff;
  box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.25);
  border-radius: 10px;
}
.text-style {
  font-family: "Barlow", sans-serif;
}
.space-width {
  padding-top: 20px;
}
.line {
  width: 1258px;
  height: 0px;
  border: 1px solid #cecece;
}
.font-recent-order h5 {
  font-size: 15px;
  line-height: 20px;
  letter-spacing: 0.1em;
  color: #000000;
}
.option-recent {
  background: #cecece;
  border-radius: 10px;
  padding-left: 10px;
  font-weight: bold;
}
.font-invoice h5 {
  font-size: 15px;
  line-height: 20px;
  letter-spacing: 0.1em;

  color: #cecece;
}
@media screen and (max-width: 500px) {
  .cart {
    display: none;
  }
  .nav-right {
    display: none;
  }
  .food-menu {
    display: flex;
    flex-wrap: wrap;
    background: #ffff;
  }
  .main-navigation {
    box-shadow: none;
  }
  .main-article {
    flex-direction: column;
  }
  .img-chart {
    width: 415px;
    margin-left: 20px;
    padding-top: 10px;
  }
}
</style>