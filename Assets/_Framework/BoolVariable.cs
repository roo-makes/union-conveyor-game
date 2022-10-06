using System;
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Framework
{
    [CreateAssetMenu(fileName = "BoolVariable", menuName = "Framework/BoolVariable")]
    public class BoolVariable : ScriptableObject
    {
        private bool _value;

        [OnValueChanged("ValueChanged")]
        [ShowInInspector]
        public bool Value
        {
            get => _value;
            set
            {
                _value = value;
                ValueChanged();
            }
        }
        public event Action<bool> OnChange;

        public override string ToString()
        {
            return Value.ToString();
        }

        public void SetValue(bool newVal)
        {
            Value = newVal;
            ValueChanged();
        }

        public void ValueChanged()
        {
            OnChange?.Invoke(Value);
        }
    }
}