import 'package:flutter/material.dart';
import 'package:teslacar/models/car.dart';
import 'package:teslacar/widgets/animate_in_effect.dart';
import 'package:teslacar/widgets/fade_in_effect.dart';
import '../utils/styles/app_colors.dart';

class CarPage extends StatefulWidget {
  const CarPage(
    this.car, {
    Key? key,
  }) : super(key: key);

  final Car car;

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 23,
            ),
            onPressed: null,
          )
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'car_${widget.car.id}',
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/images/tesla.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: 'car_${widget.car.id}_title',
                                      child: Text(
                                        widget.car.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        widget.car.date,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(color: Colors.white70),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    widget.car.rate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 10,
                          child: Hero(
                            tag: 'car_${widget.car.id}_image',
                            child: Image(
                              image: AssetImage(widget.car.image),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FadeInEffect(
                                  intervalStart: 0.5,
                                  keepAlive: true,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 9, bottom: 9),
                                    child: Text(
                                      "Spécifications",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimateInEffect(
                                    keepAlive: true,
                                    intervalStart: 1 / 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 18, bottom: 18),
                                      width: 175,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.punch_clock_rounded,
                                            color: Colors.white,
                                            size: 45,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 50, top: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "322",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "km/h",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                        color: Colors.white70,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AnimateInEffect(
                                    keepAlive: true,
                                    intervalStart: 2 / 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 18, bottom: 18),
                                      width: 175,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.car_rental_sharp,
                                            color: Colors.white,
                                            size: 45,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 50, top: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Liftback",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AnimateInEffect(
                                    keepAlive: true,
                                    intervalStart: 3 / 5,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 18, bottom: 18),
                                      width: 175,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.punch_clock_rounded,
                                            color: Colors.white,
                                            size: 45,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 50,
                                              top: 10,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "322",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4!
                                                      .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "km/h",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                        color: Colors.white70,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FadeInEffect(
                                            keepAlive: true,
                                            intervalStart: 1.0,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 18),
                                              child: Text(
                                                "Location",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4!
                                                    .copyWith(
                                                      color: Colors.black,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          FadeInEffect(
                                            keepAlive: true,
                                            intervalStart: 1.0,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                right: 20,
                                                top: 20,
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.man,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    '344 m',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                          color: Colors
                                                              .grey.shade600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AnimateInEffect(
                                            keepAlive: true,
                                            intervalStart: 4 / 5,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  top: 15, bottom: 15),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Colors.blue,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Mansfield Avenu, los Angeles, CA",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                AnimateInEffect(
                                  keepAlive: true,
                                  intervalStart: 1.0,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Hero(
                                            tag: 'car_${widget.car.id}_price',
                                            child: Text(
                                              '\$${widget.car.price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color: AppColors
                                                        .textColorFromBackground(
                                                            widget.car.bgColor),
                                                    fontSize: 30,
                                                  ),
                                            ),
                                          ),
                                          Hero(
                                            tag: 'car_${widget.car.id}_date',
                                            child: Text(
                                              '/day',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                              top: 15,
                                              bottom: 15,
                                              left: 35,
                                              right: 55,
                                            ),
                                            child: Text(
                                              "Book now",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
