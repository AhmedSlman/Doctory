import 'package:doctory/core/widgets/custom_toast.dart';
import 'package:doctory/core/widgets/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/date_picker.dart';
import 'package:doctory/features/settings/presentation/views/widgets/save_changes_button.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/booking_model.dart';
import '../../../../home/data/models/offer_model.dart';
import '../../../../home/presentation/view_models/home_cubit/home_cubit.dart';
import '../../../../home/presentation/view_models/home_cubit/home_state.dart';

class BookingDialog extends StatefulWidget {
  final OffersModel offer;

  const BookingDialog({super.key, required this.offer});

  @override
  _BookingDialogState createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  DateTime? _bookingDate;
  TimeOfDay? _bookingTime;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is BookingSuccess) {
              Navigator.of(context).pop();
              showToast(
                msg: S.of(context).saveEditSuccess,
                color: AppColors.greenColor,
              );
            } else if (state is BookingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Form(
                key:_formKey ,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(S.of(context).bookNow, style: AppStyles.sBlack15),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _patientNameController,
                      hintText: S.of(context).fullPatientName,
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: _phoneController,
                      hintText: S.of(context).phone,
                      // validator:Validators.validatePhone,

                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: _emailController,
                      hintText: S.of(context).email,
                      //validator:Validators.validateEmail,
                    ),
                    SizedBox(height: 10.h),
                    CustomDatePicker(
                      hintText: S.of(context).booking,
                      onSelected: (date) => _bookingDate = date,
                    ),
                    SizedBox(height: 10.h),
                    CustomTimePicker(
                      hintText: S.of(context).bookingTime,
                      onSelected: (time) => _bookingTime = time,
                    ),
                    SizedBox(height: 20.h),
                    SaveChangesButton(
                      saveOnPressed: () {
                        if (_patientNameController.text.isNotEmpty &&
                            _phoneController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _bookingDate != null &&
                            _bookingTime != null) {
                          _submitBooking(context);
                        } else {
                          showToast(msg: 'لم يتم ادخال جميع البيانات', color: AppColors.redColor);
                        }
                      },
                      cancelOnPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _submitBooking(BuildContext context) {
    final formState = _formKey.currentState;

    if (formState != null && formState.validate()) {
      final cubit = BlocProvider.of<HomeCubit>(context);

      final bookingTimeString = BookingModel.timeOfDayToString(_bookingTime!);

      final booking = BookingModel(
        offerId: widget.offer.id,
        userId: userId,
        patientName: _patientNameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        bookingDate: _bookingDate!,
        bookingTime: bookingTimeString,
        offersModel: widget.offer,
      );

      setState(() {
        _isLoading = true;
      });

      cubit.bookOffer(booking).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      showToast(msg: 'ادخل البيانات بطريقه صحيح', color: AppColors.redColor);
    }
  }
}
