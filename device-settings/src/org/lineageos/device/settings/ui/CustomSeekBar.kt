/*
 * Copyright (C) 2026 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

package com.android.axion.compose.preferences

import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import kotlin.math.roundToInt

@Composable
fun CustomSeekBar(
    title: String,
    value: Int,
    onValueChange: (Int) -> Unit,
    min: Int = 0,
    max: Int,
    defaultValue: Int = min,
    modifier: Modifier = Modifier,
    summary: String = "",
    interval: Int = 1,
    unit: String = "",
    enabled: Boolean = true,
    position: PreferencePosition = LocalPreferencePosition.current,
    formatValue: ((Int) -> String)? = null,
    onValueChangeFinished: (() -> Unit)? = null,
) {
    val displayValue = formatValue?.invoke(value) ?: run {
        if (unit.isNotEmpty()) "$value $unit" else value.toString()
    }

    SliderPreference(
        title = title,
        summary = summary,
        value = value.toFloat(),
        onValueChange = { newValue ->
            val steppedValue = ((newValue - min) / interval).roundToInt() * interval + min
            val coerced = steppedValue.coerceIn(min, max)
            if (coerced != value) {
                onValueChange(coerced)
            }
        },
        onValueChangeFinished = {
            onValueChangeFinished?.invoke()
        },
        valueRange = min.toFloat()..max.toFloat(),
        steps = 0,
        displayValue = displayValue,
        modifier = modifier,
        enabled = enabled,
        position = position,
        onReset = {
            onValueChange(defaultValue)
            onValueChangeFinished?.invoke()
        },
    )
}
