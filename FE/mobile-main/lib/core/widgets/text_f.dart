import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.controller,
    required this.label,
    this.errorMessage,
    this.isValid = false,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.onTap,
    this.autoFillHints,
    this.description,
    this.labelTextStyle,
    this.noErrorSpace = false,
    this.focusNode,
    this.backgroundColor,
    this.hint,
    this.validatorListener,
    this.height,
    this.textStyle,
    this.maxLines = 1,
    this.semantic,
  });

  final TextEditingController? controller;
  final bool isValid;
  final String label;
  final String? errorMessage;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final Function(String)? validatorListener;
  final List<String>? autoFillHints;
  final String? description;
  final TextStyle? labelTextStyle;
  final TextStyle? textStyle;
  final bool noErrorSpace;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final String? hint;
  final double? height;
  final int maxLines;
  final String? semantic;

  @override
  TextFState createState() => TextFState();
}

class TextFState extends State<TextF> {
  late FocusNode _fn;
  bool _isFocus = false;
  bool _isError = false;
  bool _isFirstLoad = true;

  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _fn = widget.focusNode ?? FocusNode();
    _fn.addListener(() {
      setState(() {
        _isFocus = _fn.hasFocus;

        /// Check if focus changed
        if (!_isFocus) {
          _isError = !widget.isValid;
        }
      });
    });
  }

  void _updateStatus() {
    if (_isFirstLoad) {
      _isFirstLoad = false;
    } else {
      if (_isFocus) {
        _isError = !widget.isValid;
      }
    }
  }

  void setIsError({required bool isError}) {
    setState(() {
      if (_isFirstLoad) {
        _isFirstLoad = false;
      } else {
        _isError = isError;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateStatus();

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: widget.height ?? Dimens.textField,
                decoration: BoxDecoration(
                  color: widget.enabled
                      ? widget.backgroundColor ??
                          Theme.of(context).extension<LzyctColors>()!.background
                      : Theme.of(context).extension<LzyctColors>()!.shadow,
                  border: Border.all(
                    color: _isError
                        ? Theme.of(context).extension<LzyctColors>()!.red!
                        : Palette.color0F5,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: Dimens.space4),
              ),
              Positioned(
                top: Dimens.space5,
                left: Dimens.space6,
                right: Dimens.zero,
                bottom: Dimens.space4,
                child: _textFormField,
              ),
            ],
          ),
          if (widget.description != null && !_isError)
            Padding(
              padding: EdgeInsets.only(top: Dimens.space6),
              child: Text(
                widget.description!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _isError
                          ? Theme.of(context).extension<LzyctColors>()!.red!
                          : Theme.of(context).extension<LzyctColors>()!.shadow,
                    ),
              ),
            ),
          if (!widget.noErrorSpace) ...[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isError && widget.errorMessage != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: Dimens.space16,
                        top: Dimens.space4,
                      ),
                      child: Text(
                        widget.errorMessage ?? "",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .extension<LzyctColors>()!
                                  .red,
                            ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            const SpacerV(),
          ],
        ],
      ),
    );
  }

  Widget get _textFormField {
    return Semantics(
      label: widget.semantic,
      child: TextFormField(
        autofillHints: widget.autoFillHints,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        focusNode: _fn,
        maxLines: widget.maxLines,
        onTap: widget.onTap,
        style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium500,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimens.space12,
            horizontal: Dimens.space12,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixIcon: widget.prefixIcon != null ? Padding(
              padding: const EdgeInsets.only(right: 8),
              child: widget.prefixIcon) : const SpacerV(value: 0),
          prefixIconConstraints:  widget.prefixIcon != null ? const BoxConstraints(
              maxWidth: 32, maxHeight: 24, minHeight: 24, minWidth: 32) : const BoxConstraints(
              maxWidth: 0, maxHeight: 0),
          suffixIcon: widget.suffixIcon,
          alignLabelWithHint: true,
          hintText: widget.hint,
          floatingLabelBehavior:
              widget.hint != null ? FloatingLabelBehavior.always : null,
          hintStyle: const TextStyle(
            color: Palette.color9C3,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        onChanged: (String value) =>
            _debouncer.run(() => widget.validatorListener?.call(value)),
        onSaved: (String? value) => widget.validatorListener?.call(value ?? ""),
      ),
    );
  }
}
