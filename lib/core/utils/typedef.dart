import 'package:dartz/dartz.dart';
import 'package:local_auth/local_auth.dart';
import 'package:minimalist_social_app/core/errors/auth_error.dart';
import 'package:minimalist_social_app/core/errors/local_auth_error.dart';
import 'package:minimalist_social_app/features/auth/data/models/auth_user_model.dart';

//----------------------------------Auth-----------------------------
typedef EitherAuthUserOrAuthError = Either<AuthError, AuthUserModel>;
typedef EitherTrueOrAuthError = Either<AuthError, bool>;

typedef EitherFutureTrueOrAuthError = Future<Either<AuthError, bool>>;

typedef FutureEitherAuthUserOrAuthError
    = Future<Either<AuthError, AuthUserModel>>;

typedef FutureEitherLocalAuthUserOrAuthError
    = Future<Either<AuthError, AuthUserModel>>;

//-----------------------Local Auth -------------------------------------------

typedef EitherBoolOrLocalAuthError = Future<Either<LocalAuthError, bool>>;

typedef EitherListOfBiometricsOrLocalAuthError
    = Future<Either<LocalAuthError, List<BiometricType>>>;
