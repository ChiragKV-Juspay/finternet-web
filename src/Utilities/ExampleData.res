type bankOptionsType = {
  id: string,
  name: string,
  ltvRatio: string,
  interestRate: string,
  imagePath: string,
  cardNumber: string,
}
type transactionType =
  | Credited
  | Debited

type contactOptionsType = {
  id: string,
  name: string,
  finternetId: string,
  imagePath: string,
  amount: string,
  transactionType: transactionType,
}

let bankOptions = [
  {
    id: "1",
    name: "ABC Bank",
    ltvRatio: "75%",
    interestRate: "7%",
    imagePath: "/RoundedPinkRectangle.svg",
    cardNumber: "**** **** 1234",
  },
  {
    id: "2",
    name: "Amazing Bank",
    ltvRatio: "75%",
    interestRate: "8%",
    imagePath: "/BlueTriangle.svg",
    cardNumber: "**** **** 1022",
  },
  {
    id: "3",
    name: "Best Bank",
    ltvRatio: "70%",
    interestRate: "7.3%",
    imagePath: "/GreenCircle.svg",
    cardNumber: "**** **** 9000",
  },
  {
    id: "4",
    name: "People's Bank",
    ltvRatio: "70%",
    interestRate: "7.5%",
    imagePath: "/YellowPentagon.svg",
    cardNumber: "**** **** 3000",
  },
  {
    id: "5",
    name: "Awesome Bank",
    ltvRatio: "75%",
    interestRate: "7.9%",
    imagePath: "/BlueHexagon.svg",
    cardNumber: "**** **** 0900",
  },
]

let bankAccountOptions = [
  {
    id: "1",
    name: "ABC Bank",
    ltvRatio: "80%",
    interestRate: "10%",
    imagePath: "/RoundedPinkRectangle.svg",
    cardNumber: "**** **** 1234",
  },
  {
    id: "2",
    name: "ABC Bank",
    ltvRatio: "80%",
    interestRate: "10%",
    imagePath: "/RoundedPinkRectangle.svg",
    cardNumber: "**** **** 5682",
  },
]

let contactOptions = [
  {
    id: "1",
    name: "Nandan Nilekani",
    finternetId: "nandan@finternet",
    imagePath: "/ProfilePicNandan.svg",
    amount: "100.00",
    transactionType: Debited,
  },
  {
    id: "2",
    name: "Pramod Varma",
    finternetId: "pramod.v@finternet",
    imagePath: "/ProfilePicPramod.svg",
    amount: "200.00",
    transactionType: Credited,
  },
  {
    id: "3",
    name: "Nicki Taylor",
    finternetId: "nicki.t@finternet",
    imagePath: "/ProfilePic2.svg",
    amount: "200.00",
    transactionType: Credited,
  },
]
