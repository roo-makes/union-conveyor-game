using UnityEngine;
using UnityEngine.Pool;

namespace _Game.Scripts.General
{
    public class ReturnToPool : MonoBehaviour
    {
        public ObjectPool<GameObject> pool;

        public void DestroyPooledObject()
        {
            pool.Release(gameObject);
        }
    }
}