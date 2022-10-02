using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "FloatVariable", menuName = "Framework/FloatVariable")]
    public class FloatVariable : ScriptableObject
    {
        [OnValueChanged("ValueChanged")]
        public float Value;
        public event Action<float> OnChange;

        public override string ToString()
        {
            return Value.ToString();
        }

        public void SetValue(float newVal)
        {
            Value = newVal;
            ValueChanged();
        }

        public void ValueChanged()
        {
            OnChange.Invoke(Value);
        }
    }
}