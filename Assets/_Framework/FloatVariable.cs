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
        [HideInInspector] [SerializeField] private float _value;
        public event Action<float> OnChange;

        [ShowInInspector]
        public float Value
        {
            get => _value;
            set
            {
                _value = value;
                ValueChanged();
            }
        }

        public override string ToString()
        {
            return Value.ToString();
        }

        public void ValueChanged()
        {
            OnChange?.Invoke(Value);
        }
    }
}