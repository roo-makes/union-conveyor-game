using System;
using _Game.Scripts.General;
using UnityEngine;
using UnityEngine.Pool;

namespace _Game.Scripts.Gameplay
{
    public class WidgetPool : MonoBehaviour
    {
        public static WidgetPool Instance;
        [SerializeField] private GameObject _widgetPrefab;
        [SerializeField] private int _poolCapacity;
        [SerializeField] private int _poolPrefill;
        private ObjectPool<GameObject> _widgetPool;

        void Awake()
        {
            Instance = this;
        }

        void OnEnable()
        {
            _widgetPool = new ObjectPool<GameObject>(OnObjectCreate, OnTake, OnRelease, OnObjectDestroy, true ,_poolCapacity);
            PrefillPool();
        }

        void OnDisable()
        {
            _widgetPool.Dispose();
        }

        void PrefillPool()
        {
            GameObject[] goArr = new GameObject[_poolPrefill];
            for (int i = 0; i < _poolPrefill; i++)
            {
                goArr[i] = GetWidget();
            }
            for (int i = 0; i < _poolPrefill; i++)
            {
                ReturnWidget(goArr[i]);
            }
        }

        public GameObject GetWidget()
        {
            return _widgetPool.Get();
        }

        public void ReturnWidget(GameObject go)
        {
            _widgetPool.Release(go);
        }

        private GameObject OnObjectCreate()
        {
            GameObject go = Instantiate(_widgetPrefab, transform);
            go.SetActive(false);
            // go.AddComponent<ReturnToPool>().pool = _widgetPool;
            return go;
        }

        private void OnTake(GameObject obj)
        {
            obj.transform.SetPositionAndRotation(Vector3.zero, Quaternion.identity);
            obj.SetActive(true);
        }

        private void OnRelease(GameObject obj)
        {
            obj.SetActive(false);
            obj.transform.SetParent(transform);
            obj.GetComponent<WidgetStateData>().Reset();
        }

        private void OnObjectDestroy(GameObject obj)
        {
            Destroy(obj);
        }
    }
}